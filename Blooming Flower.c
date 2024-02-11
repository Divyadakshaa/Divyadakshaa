#include <GL/glut.h>
#include <math.h>

// Flower parameters
const float flowerRadius = 0.2f;
const int numPetals = 12;
const float petalLength = 0.5f;

// Animation parameters
const float bloomSpeed = 0.01f;
float bloomProgress = 0.0f;

void drawFlower()
{
    // Draw flower center
    glColor3f(1.0f, 0.0f, 0.0f); // Red color
    glutSolidSphere(flowerRadius, 20, 20);

    // Draw petals
    glColor3f(1.0f, 1.0f, 0.0f); // Yellow color
    for (int i = 0; i < numPetals; i++)
    {
        float angle = 2 * M_PI * i / numPetals;
        glPushMatrix();
        glRotatef(angle * 180.0f / M_PI, 0.0f, 0.0f, 1.0f);
        glTranslatef(0.0f, flowerRadius, 0.0f);
        glScalef(bloomProgress, bloomProgress, 1.0f);
        glBegin(GL_TRIANGLES);
        glVertex2f(0.0f, 0.0f);
        glVertex2f(-0.1f, petalLength);
        glVertex2f(0.1f, petalLength);
        glEnd();
        glPopMatrix();
    }
}

void drawStem()
{
    // Draw stem
    glColor3f(0.0f, 1.0f, 0.0f); // Green color
    glPushMatrix();
    glTranslatef(0.0f, -0.5f, 0.0f);
    glScalef(0.1f, 1.0f, 0.1f);
    glutSolidCube(1.0f);
    glPopMatrix();
}

void display()
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
    gluLookAt(0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

    drawFlower();

    drawStem();

    glutSwapBuffers();
}

void update(int value)
{
    bloomProgress += bloomSpeed;

    if (bloomProgress > 1.0f)
        bloomProgress = 1.0f;

    glutPostRedisplay();
    glutTimerFunc(16, update, 0);
}

void reshape(int width, int height)
{
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0, (double)width / (double)height, 1.0, 10.0);
    glMatrixMode(GL_MODELVIEW);
}

int main(int argc, char **argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800, 600);
    glutCreateWindow("Blooming Flower Animation");
    glEnable(GL_DEPTH_TEST);
    glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
    glutDisplayFunc(display);
    glutReshapeFunc(reshape);
    glutTimerFunc(0, update, 0);
    glutMainLoop();
    return 0;
}